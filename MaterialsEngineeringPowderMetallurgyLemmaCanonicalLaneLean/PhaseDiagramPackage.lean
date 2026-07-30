import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  components : List String
  phases : List String
  phaseBoundaries : Prop
  eutecticPoint : Prop
  solvusLines : Prop
  invariantReactions : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundaries
  eutecticPointClosed : P.eutecticPoint
  solvusLinesClosed : P.solvusLines
  invariantReactionsClosed : P.invariantReactions

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.eutecticPoint ∧ P.solvusLines ∧ P.invariantReactions

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed (And.intro E.eutecticPointClosed (And.intro E.solvusLinesClosed E.invariantReactionsClosed))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
