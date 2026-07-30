import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PowderMetallurgyAdmittedObject where
  crystallography : CrystallographyPackage
  phaseDiagram : PhaseDiagramPackage
  elasticity : ElasticityPackage
  sintering : SinteringPackage
  powderCharacterization : PowderCharacterizationPackage
  crystallographyClosed : CrystallographyClosed crystallography
  phaseDiagramClosed : PhaseDiagramClosed phaseDiagram
  elasticityClosed : ElasticityClosed elasticity
  sinteringClosed : SinteringClosed sintering
  powderCharacterizationClosed : PowderCharacterizationClosed powderCharacterization

structure PowderMetallurgyEndgameState where
  object : PowderMetallurgyAdmittedObject

def PowderMetallurgyWitnessClosed (O : PowderMetallurgyAdmittedObject) : Prop :=
  O.crystallographyClosed ∧ O.phaseDiagramClosed ∧ O.elasticityClosed ∧
  O.sinteringClosed ∧ O.powderCharacterizationClosed

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse