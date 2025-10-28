Title ""

Controls {
}

IOControls {
	outputFile = "/home/vishwajeet/Documents/GAA/Nmos"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_channel1" {
		Species = "BoronActiveConcentration"
		Value = 1e+15
	}
	Constant "ConstantProfileDefinition_channel2" {
		Species = "BoronActiveConcentration"
		Value = 1e+15
	}
	Constant "ConstantProfileDefinition_channel3" {
		Species = "BoronActiveConcentration"
		Value = 1e+15
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext1" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext2" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext3" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext4" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext5" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_ext6" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+21, ValueAtDepth = 1e+15, Depth = 0.005)
		LateralFunction = Gauss(Factor = 0.8)
	}
	Constant "ConstantProfileDefinition_gate" {
		Species = "BoronActiveConcentration"
		Value = 1e+18
	}
	Constant "ConstantProfileDefinition_drain" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+21
	}
	Constant "ConstantProfileDefinition_substrate" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	Constant "ConstantProfileDefinition_source" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+21
	}
	Refinement "RefinementDefinition_gate" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_source" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.002 0.001 )
	}
	Refinement "RefinementDefinition_drain" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.002 0.001 )
	}
	Refinement "RefinementDefinition_channel1" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.002 0.001 )
	}
	Refinement "RefinementDefinition_channel2" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_channel3" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext1" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext2" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext3" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext4" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext5" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "RefinementDefinition_ext6" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.01 0.0001 )
	}
	Refinement "RefinementDefinition_substrate" {
		MaxElementSize = ( 0.002 0.002 0.002 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_channel1" {
		Reference = "ConstantProfileDefinition_channel1"
		EvaluateWindow {
			Element = region ["region_channel1"]
		}
	}
	Constant "ConstantProfilePlacement_channel2" {
		Reference = "ConstantProfileDefinition_channel2"
		EvaluateWindow {
			Element = region ["region_channel2"]
		}
	}
	Constant "ConstantProfilePlacement_channel3" {
		Reference = "ConstantProfileDefinition_channel3"
		EvaluateWindow {
			Element = region ["region_channel3"]
		}
	}
	Constant "ConstantProfilePlacement_source" {
		Reference = "ConstantProfileDefinition_source"
		EvaluateWindow {
			Element = region ["region_source"]
		}
	}
	Constant "ConstantProfilePlacement_drain" {
		Reference = "ConstantProfileDefinition_drain"
		EvaluateWindow {
			Element = region ["region_drain"]
		}
	}
	Constant "ConstantProfilePlacement_substrate" {
		Reference = "ConstantProfileDefinition_substrate"
		EvaluateWindow {
			Element = region ["region_body"]
		}
	}
	Constant "ConstantProfilePlacement_gate" {
		Reference = "ConstantProfileDefinition_gate"
		EvaluateWindow {
			Element = region ["region_gate"]
		}
	}
	Refinement "RefinementPlacement_gate" {
		Reference = "RefinementDefinition_gate"
		RefineWindow = region ["region_gate"]
	}
	Refinement "RefinementPlacement_source" {
		Reference = "RefinementDefinition_source"
		RefineWindow = region ["region_source"]
	}
	Refinement "RefinementPlacement_drain" {
		Reference = "RefinementDefinition_drain"
		RefineWindow = region ["region_drain"]
	}
	Refinement "RefinementPlacement_channel1" {
		Reference = "RefinementDefinition_channel1"
		RefineWindow = region ["region_channel1"]
	}
	Refinement "RefinementPlacement_channel2" {
		Reference = "RefinementDefinition_channel2"
		RefineWindow = region ["region_channel2"]
	}
	Refinement "RefinementPlacement_channel3" {
		Reference = "RefinementDefinition_channel3"
		RefineWindow = region ["region_channel3"]
	}
	Refinement "RefinementPlacement_ext1" {
		Reference = "RefinementDefinition_ext1"
		RefineWindow = region ["region_ext1_b0"]
	}
	Refinement "RefinementPlacement_ext2" {
		Reference = "RefinementDefinition_ext2"
		RefineWindow = region ["region_ext1_b1"]
	}
	Refinement "RefinementPlacement_ext3" {
		Reference = "RefinementDefinition_ext3"
		RefineWindow = region ["region_ext1_b2"]
	}
	Refinement "RefinementPlacement_ext4" {
		Reference = "RefinementDefinition_ext4"
		RefineWindow = region ["region_ext2"]
	}
	Refinement "RefinementPlacement_ext5" {
		Reference = "RefinementDefinition_ext5"
		RefineWindow = region ["region_ext3_b0"]
	}
	Refinement "RefinementPlacement_ext6" {
		Reference = "RefinementDefinition_ext6"
		RefineWindow = region ["region_ext3_b1"]
	}
	Refinement "RefinementPlacement_substrate" {
		Reference = "RefinementDefinition_substrate"
		RefineWindow = region ["region_gate"]
		RefineWindow = region ["region_body"]
		RefineWindow = region ["region_source"]
		RefineWindow = region ["region_drain"]
	}
}

