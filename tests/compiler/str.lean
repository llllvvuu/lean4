def showChars : Nat → String → String.Pos → IO Unit
| 0     _ _   := pure ()
| (n+1) s idx :=
  unless (s.atEnd idx) $
    IO.println (">> " ++ toString (s.get idx)) *>
    showChars n s (s.next idx)

def main : IO UInt32 :=
let s₁             := "hello α_world_β" in
let b : String.Pos := 0 in
let e              := s₁.bsize in
IO.println (s₁.extract b e) *>
IO.println (s₁.extract (b+2) e) *>
IO.println (s₁.extract (b+2) (e-1)) *>
IO.println (s₁.extract (b+2) (e-2)) *>
IO.println (s₁.extract (b+7) e) *>
IO.println (s₁.extract (b+8) e) *>
IO.println (toString e) *>
IO.println (repr "   aaa   ".trim) *>
showChars s₁.length s₁ 0  *>
pure 0
