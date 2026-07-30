import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
# Powder Compaction Density Package

This module models the density evolution during powder compaction using the
Heckel equation: ln(1/(1-ρ)) = Kt + A. The relative density ρ approaches
unity as compaction pressure increases. The bridge closure captures the
admissible class for compaction behavior.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure CompactionDensityPackage where
  compactionPressure : ℝ
  relativeDensity : ℝ
  heckelSlope : ℝ
  heckelIntercept : ℝ
  physicalValidity : Prop

structure CompactionDensityEvidence (C : CompactionDensityPackage) where
  pressureNonnegative : C.compactionPressure ≥ 0
  densityBetweenZeroAndOne : 0 ≤ C.relativeDensity ∧ C.relativeDensity ≤ 1
  heckelSlopePositive : C.heckelSlope > 0
  heckelInterceptReal : True
  heckelEquation : Real.log (1 / (1 - C.relativeDensity)) = C.heckelSlope * C.compactionPressure + C.heckelIntercept
  validity : C.physicalValidity

def CompactionDensityClosed (C : CompactionDensityPackage) : Prop :=
  C.compactionPressure ≥ 0 ∧ (0 ≤ C.relativeDensity ∧ C.relativeDensity ≤ 1) ∧
  C.heckelSlope > 0 ∧
  Real.log (1 / (1 - C.relativeDensity)) = C.heckelSlope * C.compactionPressure + C.heckelIntercept ∧
  C.physicalValidity

theorem compaction_density_closed_from_evidence (C : CompactionDensityPackage)
    (E : CompactionDensityEvidence C) : CompactionDensityClosed C := by
  exact And.intro E.pressureNonnegative (And.intro E.densityBetweenZeroAndOne
    (And.intro E.heckelSlopePositive (And.intro E.heckelEquation E.validity)))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse