import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  alloySystem : Type u
  temperatureCompositionSpace : Type v
  phaseBoundary : Prop
  eutecticPoint : Prop
  phaseFraction : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundaryClosed : P.phaseBoundary
  eutecticPointClosed : P.eutecticPoint
  phaseFractionClosed : P.phaseFraction

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundary ∧ P.eutecticPoint ∧ P.phaseFraction

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundaryClosed (And.intro E.eutecticPointClosed E.phaseFractionClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse