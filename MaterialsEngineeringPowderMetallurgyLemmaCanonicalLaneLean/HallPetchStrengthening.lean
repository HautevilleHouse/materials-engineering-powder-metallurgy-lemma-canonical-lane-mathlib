import canonicalLaneMathlib.AdmissibleClass

/-!
# Hall-Petch Strengthening Package

This module encodes the Hall-Petch relationship for grain boundary strengthening
in powder metallurgy materials. The yield strength increases with decreasing
grain size according to σ_y = σ_0 + k_y / √d. The bridge packages this
as an admissible class closure.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure HallPetchPackage where
  grainSize : ℝ
  frictionStress : ℝ
  hallPetchSlope : ℝ
  yieldStrength : ℝ
  physicalValidity : Prop

structure HallPetchEvidence (H : HallPetchPackage) where
  grainSizePositive : H.grainSize > 0
  frictionStressNonnegative : H.frictionStress ≥ 0
  hallPetchSlopePositive : H.hallPetchSlope > 0
  yieldStrengthFormula : H.yieldStrength = H.frictionStress + H.hallPetchSlope / Real.sqrt H.grainSize
  validity : H.physicalValidity

def HallPetchClosed (H : HallPetchPackage) : Prop :=
  H.grainSize > 0 ∧ H.frictionStress ≥ 0 ∧ H.hallPetchSlope > 0 ∧
  H.yieldStrength = H.frictionStress + H.hallPetchSlope / Real.sqrt H.grainSize ∧ H.physicalValidity

theorem hall_petch_closed_from_evidence (H : HallPetchPackage)
    (E : HallPetchEvidence H) : HallPetchClosed H := by
  exact And.intro E.grainSizePositive (And.intro E.frictionStressNonnegative
    (And.intro E.hallPetchSlopePositive (And.intro E.yieldStrengthFormula E.validity)))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse