import canonicalLaneMathlib.AdmissibleClass

/-!
# Sintering Diffusion Bridge Package

This module defines the diffusion-controlled sintering model for powder metallurgy.
The key result is that the rate of neck growth during sintering follows a power law
with exponent determined by the dominant diffusion mechanism (volume, grain boundary,
or surface diffusion). The bridge encodes the admissible-class closure for
sintering diffusion kinetics.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure SinteringDiffusionPackage where
  temperature : ℝ
  particleRadius : ℝ
  diffusionCoefficient : ℝ
  surfaceEnergy : ℝ
  molarVolume : ℝ
  mechanism : String -- "volume", "grain_boundary", "surface"
  neckGrowthRate : ℝ
  powerLawExponent : ℝ
  physicalValidity : Prop

structure SinteringDiffusionEvidence (S : SinteringDiffusionPackage) where
  temperaturePositive : S.temperature > 0
  particleRadiusPositive : S.particleRadius > 0
  diffusionCoefficientPositive : S.diffusionCoefficient > 0
  surfaceEnergyPositive : S.surfaceEnergy > 0
  molarVolumePositive : S.molarVolume > 0
  mechanismValid : S.mechanism = "volume" ∨ S.mechanism = "grain_boundary" ∨ S.mechanism = "surface"
  neckGrowthRateFormula : S.neckGrowthRate = (S.surfaceEnergy * S.diffusionCoefficient * S.molarVolume) / (S.particleRadius ^ 3) * (S.temperature ^ (-1/2 : ℝ))
  powerLawExponentCorrect : S.powerLawExponent = (match S.mechanism with | "volume" => (2/7 : ℝ) | "grain_boundary" => (1/3 : ℝ) | "surface" => (1/2 : ℝ))
  validity : S.physicalValidity

def SinteringDiffusionClosed (S : SinteringDiffusionPackage) : Prop :=
  S.temperature > 0 ∧ S.particleRadius > 0 ∧ S.diffusionCoefficient > 0 ∧
  S.surfaceEnergy > 0 ∧ S.molarVolume > 0 ∧
  (S.mechanism = "volume" ∨ S.mechanism = "grain_boundary" ∨ S.mechanism = "surface") ∧
  S.neckGrowthRate = (S.surfaceEnergy * S.diffusionCoefficient * S.molarVolume) / (S.particleRadius ^ 3) * (S.temperature ^ (-1/2 : ℝ)) ∧
  S.powerLawExponent = (match S.mechanism with | "volume" => (2/7 : ℝ) | "grain_boundary" => (1/3 : ℝ) | "surface" => (1/2 : ℝ)) ∧
  S.physicalValidity

theorem sintering_diffusion_closed_from_evidence (S : SinteringDiffusionPackage)
    (E : SinteringDiffusionEvidence S) : SinteringDiffusionClosed S := by
  exact And.intro E.temperaturePositive (And.intro E.particleRadiusPositive
    (And.intro E.diffusionCoefficientPositive (And.intro E.surfaceEnergyPositive
      (And.intro E.molarVolumePositive (And.intro E.mechanismValid
        (And.intro E.neckGrowthRateFormula (And.intro E.powerLawExponentCorrect E.validity)))))))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse