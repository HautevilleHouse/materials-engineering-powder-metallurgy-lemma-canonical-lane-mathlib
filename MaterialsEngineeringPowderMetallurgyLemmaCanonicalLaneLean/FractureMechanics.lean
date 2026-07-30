import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Type u
  crackPropagation : Type v
  fractureToughness : Prop
  parisLaw : Prop
  failureCriterion : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  fractureToughnessClosed : F.fractureToughness
  parisLawClosed : F.parisLaw
  failureCriterionClosed : F.failureCriterion

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.fractureToughness ∧ F.parisLaw ∧ F.failureCriterion

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.fractureToughnessClosed (And.intro E.parisLawClosed E.failureCriterionClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse