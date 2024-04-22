page 50139 CertificateOfAnalysisCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CertificateOfAnalysisTable;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CertificateOfAnalysis; rec.CertificateOfAnalysis)
                {
                    ApplicationArea = All;
                    Editable=false;
                    
                }
                 field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    
                }
                field(ItemNumber; rec.ItemNumber)
                {
                    ApplicationArea = All;
                    
                }
                field(AccountSelection; rec.AccountSelection)
                {
                    ApplicationArea = All;
                    
                }
                field(CreatedBy; rec.CreatedBy)
                {
                    ApplicationArea = All;
                    
                }
                field(CreatedDateAndTime; rec.CreatedDateAndTime)
                {
                    ApplicationArea = All;
                    
                }
                field(Site; rec.Site)
                {
                    ApplicationArea = All;
                    
                }
                 field(Warehouse; rec.Warehouse)
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