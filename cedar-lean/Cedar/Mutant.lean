/-
 Copyright Cedar Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-/

module

/-! Injected faults for Basalt's bug-finding experiment (branch `basalt-mutants` only): each site
reads `mutant k`, and the running binary has fault `k` when `CEDAR_MUTANT=k` (0, the default: none).
The proofs in `Cedar.Thm` do not hold of this branch, and nothing here may be merged. -/

namespace Cedar

/-- The fault this process runs with, read once from `CEDAR_MUTANT` by the linking executable's C
side (`cedar_mutant_id` in Basalt's `Basalt/Fuzz/native.c`). -/
@[extern "cedar_mutant_id"]
public opaque mutantId : Unit → Nat

@[inline, expose]
public def mutant (k : Nat) : Bool := mutantId () == k

end Cedar
