import canonicallaneMathlib.AdmissibleClass
import canonicallaneMathlib.AdmittedObject

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "MaterialsEngineeringMetalsAlloysFoundation",
    theoremName := "MaterialsMetalsAlloysFoundation",
    theoremObject := "MetalsAlloysAdmissibleObject",
    classicalBoundary := "phaseDiagramEquilibrium & fractureToughnessBound",
    manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through phase stability and elastic closure",
    certificateLane := "materials_metals_alloys_constrained",
    carriedRemainder := "classical source boundary carried by phaseDiagramOpen and fractureToughnessUnrestricted"
  }

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
