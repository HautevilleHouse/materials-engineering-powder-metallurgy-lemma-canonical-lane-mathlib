import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SinteredDensityRatio A.object.object > 0.0

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse