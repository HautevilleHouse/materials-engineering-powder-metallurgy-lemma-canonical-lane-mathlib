import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure ElasticityPackage where
  elasticModuli : Type u
  stressTensor : Type v
  strainTensor : Type w
  hookesLaw : Prop
  yieldCriterion : Prop
  fractureToughness : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  hookesLawClosed : E.hookesLaw
  yieldCriterionClosed : E.yieldCriterion
  fractureToughnessClosed : E.fractureToughness

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.hookesLaw ∧ E.yieldCriterion ∧ E.fractureToughness

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.hookesLawClosed (And.intro Ev.yieldCriterionClosed Ev.fractureToughnessClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse