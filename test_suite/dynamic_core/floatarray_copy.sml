(*

Result: OK
 
 * Revision Log:
 * -------------
 * $Log: floatarray_copy.sml,v $
 * Revision 1.2  1997/05/28 11:55:12  jont
 * [Bug #30090]
 * Remove uses of MLWorks.IO
 *
 *  Revision 1.1  1997/01/07  15:13:03  andreww
 *  new unit
 *  [Bug #1818]
 *  floatarray tests
 *
 *
 *

Copyright 2013 Ravenbrook Limited <http://www.ravenbrook.com/>.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

val a = MLWorks.Internal.FloatArray.arrayoflist
                         (map real [0,1,2,3,4,5,6,7,8,9])

val b = MLWorks.Internal.FloatArray.array(10, 0.0)

val _ = MLWorks.Internal.FloatArray.copy(a, 0, 4, b, 1)

val _ = case (map floor (MLWorks.Internal.FloatArray.to_list b))
          of [0,0,1,2,3,0,0,0,0,0] 
            => print"Pass\n"
          | _ => print"Fail\n"


val c = (MLWorks.Internal.FloatArray.copy(a, 3, 2, b, 1);
	 MLWorks.Internal.FloatArray.from_list []) 
  handle MLWorks.Internal.FloatArray.Subscript =>
  MLWorks.Internal.FloatArray.from_list(map real [3,2,1])

val _ = case (map floor (MLWorks.Internal.FloatArray.to_list c))
          of [3,2,1] => print"Pass2\n"
           | _ => print"Fail2\n"

val d = (MLWorks.Internal.FloatArray.copy(a, 3, 11, b ,1);
	 MLWorks.Internal.FloatArray.from_list [])
  handle MLWorks.Internal.FloatArray.Subscript =>
  MLWorks.Internal.FloatArray.from_list(map real [3,11,1])

val _ = case (map floor (MLWorks.Internal.FloatArray.to_list d))
          of [3,11,1] => print"Pass3\n"
           | _ => print"Fail3\n"

val e = (MLWorks.Internal.FloatArray.copy(a, ~3, 2, b, 1);
	 MLWorks.Internal.FloatArray.from_list [])
  handle MLWorks.Internal.FloatArray.Subscript =>
  MLWorks.Internal.FloatArray.from_list(map real [253,2,1])

val _ = case (map floor (MLWorks.Internal.FloatArray.to_list e))
          of [253,2, 1] => print"Pass4\n"
           | _ => print"Fail4\n"

val f = (MLWorks.Internal.FloatArray.copy(a, 0, 9, b, 4);
	 MLWorks.Internal.FloatArray.from_list []) 
  handle MLWorks.Internal.FloatArray.Subscript =>
  MLWorks.Internal.FloatArray.from_list(map real [0,9,4])
  
val _ = case (map floor (MLWorks.Internal.FloatArray.to_list f))
          of [0, 9, 4] => print"Pass5\n"
           | _ => print"Fail5\n"


