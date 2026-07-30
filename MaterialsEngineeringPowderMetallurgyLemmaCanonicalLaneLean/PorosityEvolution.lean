import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PorosityEvolutionPackage where
  initialPorosity : Float
  finalPorosity : Float
  sinteringTime : Float
  densificationRate : Float

structure PorosityEvolutionEvidence (P : PorosityEvolutionPackage) where
  initialPorosityPositive : P.initialPorosity > 0.0
  finalPorosityNonnegative : P.finalPorosity ≥ 0.0
  sinteringTimePositive : P.sinteringTime > 0.0
  densificationRatePositive : P.densificationRate > 0.0

def PorosityEvolutionClosed (P : PorosityEvolutionPackage) : Prop :=
  P.initialPorosity > 0.0 ∧ P.finalPorosity ≥ 0.0 ∧ P.sinteringTime > 0.0 ∧ P.densificationRate > 0.0

theorem porosity_evolution_closed_from_evidence
    (P : PorosityEvolutionPackage) (E : PorosityEvolutionEvidence P) :
    PorosityEvolutionClosed P := by
  exact And.intro E.initialPorosityPositive (And.intro E.finalPorosityNonnegative (And.intro E.sinteringTimePositive E.densificationRatePositive))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse