import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  componentSystem : Type u
  temperatureRange : Prop
  compositionRange : Prop
  phaseBoundaries : Prop
  eutectoidPoint : Prop
  leverRuleValid : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  compositionRangeClosed : P.compositionRange
  phaseBoundariesClosed : P.phaseBoundaries
  eutectoidPointClosed : P.eutectoidPoint
  leverRuleValidClosed : P.leverRuleValid

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.compositionRange ∧ P.phaseBoundaries ∧ P.eutectoidPoint ∧ P.leverRuleValid

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.compositionRangeClosed
      (And.intro E.phaseBoundariesClosed
        (And.intro E.eutectoidPointClosed E.leverRuleValidClosed)))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse