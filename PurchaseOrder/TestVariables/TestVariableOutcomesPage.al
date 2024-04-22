page 50136 PageOutcomeAddition
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestVariableOutcomesTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Outcome; rec.Outcome)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;

                }
                field(OutcomeStatus; rec.OutcomeStatus)
                {
                    ApplicationArea = All;

                }
                field(Variable; rec.Variable )
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                
                begin
                    
                end;
            }
        }
    }
}