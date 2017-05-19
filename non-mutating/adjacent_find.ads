-- a specification of Adjacent_Find
with Spec_Types;
use Spec_Types;
with Spec_Types.Spec_Functions_Non_Mutating;
use Spec_Types.Spec_Functions_Non_Mutating;

package Adjacent_Find with
  SPARK_Mode is

   function Adjacent_Find (A : T_Arr) return Option with
     Contract_Cases =>
       (Has_Equal_Neighbors(A) =>
          (Adjacent_Find'Result.Exists = True) and then
          (A (Adjacent_Find'Result.Value) = A (Adjacent_Find'Result.Value + 1)) and then
          (not Has_Equal_Neighbors(A(A'First .. Adjacent_Find'Result.Value - 1))),
        others            => Adjacent_Find'Result.Exists = False
       );

end Adjacent_Find;