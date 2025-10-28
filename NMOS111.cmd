#this sdevice file includes hydrodynamic model with thermodynamic model

File{
Grid="Nmos_msh.tdr"
Plot="plot111.tdr"
Current="plotCurrent.plt"
Output="log111.log"
parameter="Silicon1.par"

}
Electrode {
{ name="source" Voltage=0.0 DistResist= 1e-8}
{ name="drain" Voltage=0.0 DistResist= 1e-8}
{ name="gate" Voltage=0 WorkFunction= 4.5}
{ Name="substrate" Voltage=0.0 DistResist= 1e-8} 


}

Thermode {
{ Name = "drain" Temperature =300  SurfaceResistance=1.5e-4}
{ Name = "gate" Temperature = 300 SurfaceResistance=1.5e-4 }
{ Name = "source" Temperature = 300 SurfaceResistance=1.5e-4}
{ Name = "substrate" Temperature = 300 SurfaceResistance=1.5e-4}
} 

Physics{
Fermi

Hydro (eTemp)

Thermodynamic
} 

Physics (material="Silicon") {

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
  Digits= 5
  RHSmin= 1e-10
  Notdamped= 50
  Iterations= 20
  ExitOnFailure
  method= ILS
  TensorGridAniso
  StressMobilityDependence= TensorFactor
  Surface "s1" (
  MaterialInterface= "HfO2/SiO2"
  )
  
  * Please uncomment if you have 8 CPUs or more
   Number_Of_Threads= 8
}

Solve{
NewCurrentFile=""

Coupled(Iterations=100){ Poisson  eQuantumPotential Temperature eTemperature  }
Coupled{ Poisson Electron Hole eQuantumPotential Temperature eTemperature  }


Quasistationary(


InitialStep=0.01 Increment=1.33
MinStep=1e-7 MaxStep=0.02
Goal{ Name="drain" Voltage= 0.05  }
){ Coupled{ Poisson Electron Hole eQuantumPotential  Temperature eTemperature} }
Quasistationary(
InitialStep=1e-2 Increment=1.33
MinStep=1e-7 MaxStep=0.04
Goal{ Name="gate" Voltage=0.7 }
){ Coupled{ Poisson Electron Hole eQuantumPotential  Temperature eTemperature} }
}
