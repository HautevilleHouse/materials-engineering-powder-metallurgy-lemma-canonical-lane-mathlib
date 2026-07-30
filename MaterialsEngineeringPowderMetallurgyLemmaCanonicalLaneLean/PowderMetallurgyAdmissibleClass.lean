import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure SinteredObject where
  species : Type
  packingFraction : Float
  greenDensity : Float
  theoreticalMaxDensity : Float

def SinteredDensityRatio (s : SinteredObject) : Float :=
  s.greenDensity / s.theoreticalMaxDensity

structure MaterialPowderMetallurgyAdmittedObject where
  object : SinteredObject
  conclusion : SinteredDensityRatio object > 0.0

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse