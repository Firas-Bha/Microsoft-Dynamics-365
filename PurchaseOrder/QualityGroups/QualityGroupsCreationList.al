page 50128 QualityGroupCreationList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = QualityGroupTable;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Quality Group"; rec.QualityGroup)
                {
                    ApplicationArea = All;
                    
                }
                field (Description;rec.Description)
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