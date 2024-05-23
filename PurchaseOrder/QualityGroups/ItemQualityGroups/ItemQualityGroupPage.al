page 50123 ItemQualityGroupPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ItemQualityGroupTable;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Item Number"; rec."Item Number")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                  var
                    ItemRecord: Record "Item";
                begin
                    if ItemRecord.Get(Rec."Item Number") then
                        Rec.Item := ItemRecord.Description;
                end;

                }
                field("Desc"; rec."Item")
                {
                    ApplicationArea = All;
                    Editable=false;

                }

                field("Quality Group"; rec."Quality Group")
                {
                    ApplicationArea = All;
                }
            }
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
    
    var
        myInt: Integer;
}