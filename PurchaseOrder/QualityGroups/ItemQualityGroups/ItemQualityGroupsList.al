page 50131 ItemQualityGroupList
{
    PageType = List;
    Caption ='Item Quality Group Creation';
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
                field("Desc"; rec."Item")
                {
                    ApplicationArea = All;
                    //Editable=false;

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
            action(ItemQualityGroupPage)
            {
                 Caption = 'Item Quality Group Creation';
                ApplicationArea = All;
                PromotedCategory = Category10;
                Promoted = true;
                PromotedIsBig = true;
                Image = New;

                trigger OnAction();
                var
                    testgroup: Page "ItemQualityGroupPage";
                begin
                    testgroup.run();
                end;
            }
        }
    }


}