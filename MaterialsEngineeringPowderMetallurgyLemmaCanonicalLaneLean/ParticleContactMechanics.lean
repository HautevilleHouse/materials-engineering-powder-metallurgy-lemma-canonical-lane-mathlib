import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure ParticleContactPackage where
  contactRadius : Float
  appliedPressure : Float
  yieldStrength : Float
  cohesion : Float

structure ParticleContactEvidence (P : ParticleContactPackage) where
  contactRadiusPositive : P.contactRadius > 0.0
  appliedPressurePositive : P.appliedPressure > 0.0
  yieldStrengthPositive : P.yieldStrength > 0.0
  cohesionNonnegative : P.cohesion ≥ 0.0

def ParticleContactClosed (P : ParticleContactPackage) : Prop :=
  P.contactRadius > 0.0 ∧ P.appliedPressure > 0.0 ∧ P.yieldStrength > 0.0 ∧ P.cohesion ≥ 0.0

theorem particle_contact_closed_from_evidence
    (P : ParticleContactPackage) (E : ParticleContactEvidence P) :
    ParticleContactClosed P := by
  exact And.intro E.contactRadiusPositive (And.intro E.appliedPressurePositive (And.intro E.yieldStrengthPositive E.cohesionNonnegative))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse