import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure GrainGrowth where
  grainBoundaryEnergy : ℝ
  grainGrowthExponent : ℝ
  annealingTemperature : ℝ
  grainSizeEvolution : Prop

structure PhaseTransformation where
  nucleationRate : ℝ
  growthRate : ℝ
  transformationKinetics : Prop

structure MicrostructureEvolutionPackage where
  grainGrowth : GrainGrowth
  phaseTransformation : PhaseTransformation
  porosityEvolution : Prop
  finalMicrostructure : Prop

structure MicrostructureEvolutionEvidence (M : MicrostructureEvolutionPackage) where
  grainGrowthClosed : M.grainGrowth.grainSizeEvolution
  phaseTransformationClosed : M.phaseTransformation.transformationKinetics
  porosityEvolutionClosed : M.porosityEvolution
  finalMicrostructureClosed : M.finalMicrostructure

def MicrostructureEvolutionClosed (M : MicrostructureEvolutionPackage) : Prop :=
  M.grainGrowth.grainSizeEvolution ∧ M.phaseTransformation.transformationKinetics ∧ M.porosityEvolution ∧ M.finalMicrostructure

theorem microstructure_evolution_closed_from_evidence (M : MicrostructureEvolutionPackage) (E : MicrostructureEvolutionEvidence M) : MicrostructureEvolutionClosed M := by
  exact And.intro E.grainGrowthClosed (And.intro E.phaseTransformationClosed (And.intro E.porosityEvolutionClosed E.finalMicrostructureClosed))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
