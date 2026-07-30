import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure ElasticityPackage where
  elasticModulus : Type u
  yieldStrength : Type v
  hookesLaw : Prop
  linearElasticDeformation : Prop
  plasticDeformationThreshold : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  hookesLawClosed : E.hookesLaw
  linearElasticDeformationClosed : E.linearElasticDeformation
  plasticDeformationThresholdClosed : E.plasticDeformationThreshold

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.hookesLaw ∧ E.linearElasticDeformation ∧ E.plasticDeformationThreshold

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.hookesLawClosed (And.intro Ev.linearElasticDeformationClosed Ev.plasticDeformationThresholdClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse