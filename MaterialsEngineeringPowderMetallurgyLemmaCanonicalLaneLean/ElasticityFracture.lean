import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure ElasticityFracturePackage where
  stressStrainRelation : Prop
  youngsModulus : Prop
  yieldStrength : Prop
  fractureToughness : Prop
  crackPropagationModel : Prop

structure ElasticityFractureEvidence (E : ElasticityFracturePackage) where
  stressStrainRelationClosed : E.stressStrainRelation
  youngsModulusClosed : E.youngsModulus
  yieldStrengthClosed : E.yieldStrength
  fractureToughnessClosed : E.fractureToughness
  crackPropagationModelClosed : E.crackPropagationModel

def ElasticityFractureClosed (E : ElasticityFracturePackage) : Prop :=
  E.stressStrainRelation ∧ E.youngsModulus ∧ E.yieldStrength ∧
  E.fractureToughness ∧ E.crackPropagationModel

theorem elasticity_fracture_closed_from_evidence
    (E : ElasticityFracturePackage) (Ev : ElasticityFractureEvidence E) :
    ElasticityFractureClosed E := by
  exact And.intro Ev.stressStrainRelationClosed
    (And.intro Ev.youngsModulusClosed
      (And.intro Ev.yieldStrengthClosed
        (And.intro Ev.fractureToughnessClosed Ev.crackPropagationModelClosed)))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
