page 50130 WorkerResponsiblePage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = WorkerResponsibleTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Worker; rec.Worker)
                {
                    ApplicationArea = All;

                }
                field("WorkerResponsible"; rec.WorkerResponsible)
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

                trigger OnAction()
                begin

                end;
            }
        }
    }
}