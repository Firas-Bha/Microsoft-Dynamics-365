page 50131 ItemQualityGroupList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ItemQualityGroupTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item Number"; rec."Item Number")
                {
                    ApplicationArea = All;

                }
                field("Quality Group"; rec."Quality Group")
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