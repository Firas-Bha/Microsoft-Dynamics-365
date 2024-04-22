report 50128 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = RDLC;
    defaultlayout = RDLC;

    RDLCLayout = 'MyReport.rdl';

    dataset
    {
        dataitem(DataItemName; CertificateOfAnalysisTable)
        {
            column(CertificateOfAnalysis; CertificateOfAnalysis)
            {
                IncludeCaption = true;
                Caption = 'Certificate Of Analysis';
            }
            column(ItemNumber; ItemNumber)
            {
                IncludeCaption = true;
                Caption = 'Item Number';
            }
            column(AccountSelection; AccountSelection)
            {
                IncludeCaption = true;
                Caption = 'Account Selection';
            }
            column(CreatedBy; CreatedBy)
            {
                IncludeCaption = true;
                Caption = 'Created By';
            }
            column(CreatedDateAndTime; CreatedDateAndTime)
            {
                IncludeCaption = true;
                Caption = 'Created Date And Time';
            }
            column(Site; Site)
            {
                IncludeCaption = true;
                Caption = 'Site';
            }
            column(Warehouse; Warehouse)
            {
                IncludeCaption = true;
                Caption = 'Warehouse';
            }
            column(Description; Description)
            {
                IncludeCaption = true;
                Caption = 'Description';
            }
            column(Test; test)
            {
                IncludeCaption = true;
                Caption = 'Test';
            }
            column(ReferenceType; ReferenceType)
            {
                IncludeCaption = true;
                Caption = 'Reference Type';
            }
            column(RefernceNumber; ReferenceNumber)
            {
                IncludeCaption = true;
                Caption = 'Refernce Number';
            }
            column(Status; Status)
            {
                IncludeCaption = true;
                Caption = 'Status';
            }
            column(QualityOrder; QualityOrder)
            {
                IncludeCaption = true;
                Caption = 'Quality Order';
            }
            column(Quantity; Quantity)
            {
                IncludeCaption = true;
                Caption = 'Quantitiy';
            }
             
        }

    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
}