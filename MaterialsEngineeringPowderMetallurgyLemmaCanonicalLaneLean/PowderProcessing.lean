import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PowderProcessingPackage where
  powderCompaction : Type u
  sintering : Type v
  particleSizeDistribution : Prop
  densificationKinetics : Prop
  poreRemoval : Prop

structure PowderProcessingEvidence (P : PowderProcessingPackage) where
  particleSizeDistributionClosed : P.particleSizeDistribution
  densificationKineticsClosed : P.densificationKinetics
  poreRemovalClosed : P.poreRemoval

def PowderProcessingClosed (P : PowderProcessingPackage) : Prop :=
  P.particleSizeDistribution ∧ P.densificationKinetics ∧ P.poreRemoval

theorem powder_processing_closed_from_evidence (P : PowderProcessingPackage)
    (E : PowderProcessingEvidence P) : PowderProcessingClosed P := by
  exact And.intro E.particleSizeDistributionClosed (And.intro E.densificationKineticsClosed E.poreRemovalClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse