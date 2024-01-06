module Constraints where

import AST
import Parser

type Constraints = [(Factor, Factor)]

analyzeConstraintsSignature :: Constraints -> Signature -> Signature -> Constraints
analyzeConstraintsSignature c (Signature _ Colon te1) (Signature _ Colon te2) = analyzeConstraintsTypeExpr c te1 te2

analyzeConstraintsTypeExpr :: Constraints -> TypeExpr -> TypeExpr -> Constraints
analyzeConstraintsTypeExpr c (Single f1) (Single f2) = analyzeConstraintsFactor c f1 f2
analyzeConstraintsTypeExpr c (Single f1) (Function f2 To _) = analyzeConstraintsFactor c f1 f2
analyzeConstraintsTypeExpr c (Single f1) (Constrained _ RightArrow (Single f2)) = analyzeConstraintsFactor c f1 f2
analyzeConstraintsTypeExpr c (Single f1) (Constrained _ RightArrow (Function f2 To _)) = analyzeConstraintsFactor c f1 f2
analyzeConstraintsTypeExpr c (Function f1 To _) (Single f2) = analyzeConstraintsFactor c f1 f2
analyzeConstraintsTypeExpr c (Constrained f1 RightArrow _) (Single f2) = analyzeConstraintsFactor c f1 f2

analyzeConstraintsFactor :: Constraints -> Factor -> Factor -> Constraints
analyzeConstraintsFactor c f1 f2
    | f1 == f2  = c
    | otherwise = c ++ [(f1, f2)]