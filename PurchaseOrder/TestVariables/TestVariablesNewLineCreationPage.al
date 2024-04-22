page 50135 TestVariableNewLineCreation
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestVariablesTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Variable; rec.Variable)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

   actions
{
    area(Processing)
    {
        action(Outcomes)
        {
            Caption = 'Outcomes';
            ApplicationArea = All;
            Promoted = true;
            PromotedCategory = Process;
            PromotedIsBig = true;

            trigger OnAction();
            var
                pageOutcome : Page "PageOutcomeAddition";
                PageVariable: Record "TestVariablesTable"; // Corrected variable name              
                    begin
                        
                        PageVariable.Get(rec.Variable) ; 
                                          
                        pageOutcome.Run();                      
                    end;
        }
    }
}

}