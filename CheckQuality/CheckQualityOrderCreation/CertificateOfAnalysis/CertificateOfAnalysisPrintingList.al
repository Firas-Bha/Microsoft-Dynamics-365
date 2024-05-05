page 50127 CertificateOfAnalysisList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CertificateOfAnalysisTable;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CertificateOfAnalysis; rec.CertificateOfAnalysis)
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
                   field(QualityOrder; rec.QualityOrder)
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
              action(GoToCard)
            {
                Caption = 'Certificate Of Analysis';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = NewItem;
                PromotedCategory = Process;
                RunObject = page CertificateOfAnalysisCard;
                trigger OnAction();

                begin

                end;
            }

            action(ExportReport)
{
    Caption = 'Export Report';
    Image = Export;
    PromotedCategory = Report;
    Promoted = true;
    PromotedIsBig = true;
    ApplicationArea = All;
   RunObject = report "MyReport";
   //RunPageLink= "QualityOrder"=field(QualityOrder);
    
}

        }
}
}
       