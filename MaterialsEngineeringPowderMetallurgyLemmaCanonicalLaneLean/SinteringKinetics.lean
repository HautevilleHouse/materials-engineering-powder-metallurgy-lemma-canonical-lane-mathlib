import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure SinteringPackage where
  diffusionCoefficient : Type u
  grainGrowth : Type v
  densificationRate : Prop
  poreClosure : Prop
  neckGrowth : Prop
  finalTheoreticalDensity : Prop

structure SinteringEvidence (S : SinteringPackage) where
  densificationRateClosed : S.densificationRate
  poreClosureClosed : S.poreClosure
  neckGrowthClosed : S.neckGrowth
  finalTheoreticalDensityClosed : S.finalTheoreticalDensity

def SinteringClosed (S : SinteringPackage) : Prop :=
  S.densificationRate ∧ S.poreClosure ∧ S.neckGrowth ∧ S.finalTheoreticalDensity

theorem sintering_closed_from_evidence (S : SinteringPackage) (E : SinteringEvidence S) :
    SinteringClosed S := by
  exact And.intro E.densificationRateClosed
    (And.intro E.poreClosureClosed
      (And.intro E.neckGrowthClosed E.finalTheoreticalDensityClosed))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse