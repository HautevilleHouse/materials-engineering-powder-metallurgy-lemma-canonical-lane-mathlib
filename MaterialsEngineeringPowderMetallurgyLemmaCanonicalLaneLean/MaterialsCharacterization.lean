import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure MechanicalTesting where
  tensileStrength : ℝ
  yieldStrength : ℝ
  hardness : ℝ
  ductility : ℝ
  strengthPositive : tensileStrength > 0 ∧ yieldStrength > 0

structure ThermalAnalysis where
  thermalConductivity : ℝ
  specificHeat : ℝ
  coefficientOfThermalExpansion : ℝ
  thermalPropertiesPositive : thermalConductivity > 0 ∧ specificHeat > 0

structure MaterialsCharacterizationPackage where
  mechanicalTesting : MechanicalTesting
  thermalAnalysis : ThermalAnalysis
  microstructureAnalysis : Prop
  compositionAnalysis : Prop

structure MaterialsCharacterizationEvidence (M : MaterialsCharacterizationPackage) where
  mechanicalTestingClosed : M.mechanicalTesting.strengthPositive
  thermalAnalysisClosed : M.thermalAnalysis.thermalPropertiesPositive
  microstructureAnalysisClosed : M.microstructureAnalysis
  compositionAnalysisClosed : M.compositionAnalysis

def MaterialsCharacterizationClosed (M : MaterialsCharacterizationPackage) : Prop :=
  M.mechanicalTesting.strengthPositive ∧ M.thermalAnalysis.thermalPropertiesPositive ∧ M.microstructureAnalysis ∧ M.compositionAnalysis

theorem materials_characterization_closed_from_evidence (M : MaterialsCharacterizationPackage) (E : MaterialsCharacterizationEvidence M) : MaterialsCharacterizationClosed M := by
  exact And.intro E.mechanicalTestingClosed (And.intro E.thermalAnalysisClosed (And.intro E.microstructureAnalysisClosed E.compositionAnalysisClosed))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
