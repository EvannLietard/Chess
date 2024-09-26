How to do mutationTest for method:
testCases :=  {MyPawnTest}.
methodToMutate := {MyPawn >> #shouldPromote}.
analysis := MTAnalysis new
    testClasses: testCases;
    methodsToMutate: methodToMutate.

analysis run.

analysis generalResult.
