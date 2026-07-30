import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure ThermalTreatmentPackage where
  heatTreatmentCycle : Type u
  quenchRate : Type v
  phaseTransformationKinetics : Prop
  timeTemperatureTransformation : Prop
  grainGrowthControl : Prop

structure ThermalTreatmentEvidence (T : ThermalTreatmentPackage) where
  phaseTransformationKineticsClosed : T.phaseTransformationKinetics
  timeTemperatureTransformationClosed : T.timeTemperatureTransformation
  grainGrowthControlClosed : T.grainGrowthControl

def ThermalTreatmentClosed (T : ThermalTreatmentPackage) : Prop :=
  T.phaseTransformationKinetics ∧ T.timeTemperatureTransformation ∧ T.grainGrowthControl

theorem thermal_treatment_closed_from_evidence (T : ThermalTreatmentPackage)
    (E : ThermalTreatmentEvidence T) : ThermalTreatmentClosed T := by
  exact And.intro E.phaseTransformationKineticsClosed (And.intro E.timeTemperatureTransformationClosed E.grainGrowthControlClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse