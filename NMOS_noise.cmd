# This sdevice file includes hydrodynamic model with thermodynamic model, modified for noise simulation in GAA transistor.
# Modifications include: Loop for multiple noisy structures (process-induced noise), RDF for electrical noise, and output handling for ML integration.

File{
  Grid="Nmos_msh.tdr"  ; Default grid; will be overridden in loop for noisy structures
  Plot="plot"
  Current="plotCurrent"
  Output="log"
  Parameter="Silicon1.par"
}

Electrode {
  { name="source" Voltage=0.0 DistResist=1e-8 }
  { name="drain" Voltage=0.0 DistResist=1e-8 }
  { name="gate" Voltage=0 WorkFunction=4.5 }
  { Name="substrate" Voltage=0.0 DistResist=1e-8 }
}

Thermode {
  { Name="drain" Temperature=300 SurfaceResistance=1.5e-4 }
  { Name="gate" Temperature=300 SurfaceResistance=1.5e-4 }
  { Name="source" Temperature=300 SurfaceResistance=1.5e-4 }
  { Name="substrate" Temperature=300 SurfaceResistance=1.5e-4 }
}

Physics {
  Fermi
  Hydro (eTemp)
  Thermodynamic
}

Physics (Material="Silicon") {
  Hydro (eTemp)
  Thermodynamic
  Fermi
  eQuantumPotential
  EffectiveIntrinsicDensity( BandGapNarrowing( OldSlotBoom ) )
  Mobility (
    Enormal (
      RPS     # Used for remote phonon scattering (RPS)
      NegInterfaceCharge (SurfaceName="s1")  # Used for remote Coulomb scattering (RCS) and remote dipole scattering (RDS)
      PosInterfaceCharge (SurfaceName="s1")  # Used for RCS and RDS
    )
    ThinLayer(IALMob)
    HighFieldSaturation
  )
  Recombination ( SRH(DopingDep) Auger Band2Band ( Model = Hurkx ) )
  
  # Added for electrical noise: Random Dopant Fluctuations (RDF)
  Doping (RandomDopant (Gaussian (Mean=1e18 Variance=1e17)))
}

Physics (MaterialInterface="Silicon/SiO2") {
  DistrThermalResist=1e-4
}

Physics (MaterialInterface="HfO2/SiO2") {
  DistrThermalResist=8.3e-4
}

Plot {
  Temperature
  eTemperature
  hTemperature
  eHeatFlux
  hHeatFlux
  lHeatFlux
  eDensity hDensity
  eCurrent hCurrent
  TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
  eMobility hMobility
  eVelocity hVelocity
  eEnormal hEnormal
  ElectricField/Vector Potential SpaceCharge
  eQuasiFermi hQuasiFermi
  Potential Doping SpaceCharge
  SRH Auger
  AvalancheGeneration
  DonorConcentration AcceptorConcentration
  Doping
  eGradQuasiFermi/Vector hGradQuasiFermi/Vector
  eEparallel hEparalllel
  BandGap
  BandGapNarrowing
  Affinity
  ConductionBand ValenceBand
}

Math {
  Extrapolate
  Derivatives
  RelErrControl
  Digits=5
  RHSmin=1e-10
  Notdamped=50
  Iterations=20
  ExitOnFailure
  Method=ILS
  TensorGridAniso
  StressMobilityDependence=TensorFactor
  Surface "s1" (
    MaterialInterface="HfO2/SiO2"
  )
  
  # Uncomment if you have 8 CPUs or more
  Number_Of_Threads=8
  
  # Added for noise simulations: Random seed for RDF reproducibility
  RandomSeed=12345  ; Change this per iteration for different noise realizations
}

# Loop for noise simulations: Run 100 iterations with noisy structures
# Assume noisy_structure_%d.tdr files are pre-generated in Sentaurus Process/SDE with variations (e.g., ±5% gate length, nanosheet thickness)
(loop (i 1 100 1)
  (set GridFile (format "noisy_structure_%d.tdr" i))
  (set PlotFile (format "plot_%d" i))
  (set CurrentFile (format "plotCurrent_%d" i))
  (set OutputFile (format "log_%d" i))
  (set RandomSeed i)  ; Vary seed for each iteration to simulate different RDF noise

  Solve {
    NewCurrentFile=""
    
    Coupled(Iterations=100){ Poisson eQuantumPotential Temperature eTemperature }
    Coupled{ Poisson Electron Hole eQuantumPotential Temperature eTemperature }
    
    Quasistationary(
      InitialStep=0.01 Increment=1.33
      MinStep=1e-7 MaxStep=0.02
      Goal{ Name="drain" Voltage=0.05 }
    ){ Coupled{ Poisson Electron Hole eQuantumPotential Temperature eTemperature } }
    
    Quasistationary(
      InitialStep=1e-2 Increment=1.33
      MinStep=1e-7 MaxStep=0.04
      Goal{ Name="gate" Voltage=0.7 }
    ){ Coupled{ Poisson Electron Hole eQuantumPotential Temperature eTemperature } }
  }
)

# After running, extract outputs (e.g., plotCurrent_%d) for ML noise reduction in Python
