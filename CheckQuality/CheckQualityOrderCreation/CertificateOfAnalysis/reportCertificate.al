report 50128 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = RDLC;
    defaultlayout = RDLC;

    RDLCLayout = 'MyReport.rdl';

    dataset
    {
        dataitem(DataItemName; CheckQualityOrderTable)
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
            column(TestGroup; TestGroup)
            {
                IncludeCaption = true;
                Caption = 'Test Group';

            }
            column(outc; TestGroup)
            {
                IncludeCaption = true;
                Caption = 'Test Group';

            }
            /*
            column(Quantity; Quantity)
            {
                IncludeCaption = true;
                Caption = 'Quantitiy';
            }
            */

        }
        dataitem(TestResults; QualityOrderLineResultsTable)
        {
            DataItemLink = QualityOrder = FIELD(QualityOrder);
            DataItemLinkReference = DataItemName;
            column(QualityOrderr; QualityOrder)
            {
                IncludeCaption = true;
                Caption = 'Quality Order';
            }

            column(ResultsQuantity; ResultsQuantity)
            {
                IncludeCaption = true;
                Caption = 'Results Quantity';
            }
            column(Outcome; Outcome)
            {
                IncludeCaption = true;
                Caption = 'Outcome';
            }
            column(Test; test)
            {
                IncludeCaption = true;

            }
            column(TestResultString; TestResultString)
            {
                IncludeCaption = true;


            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            //TestResult: record "QualityOrderLineResultsTable";
            begin
                TestResults.SetFilter("QualityOrder", DataItemName.QualityOrder);
                if TestResults.FindFirst() then begin
                    repeat
                        if (TestResults.Test = true) then begin
                            TestResults.TestResultString := 'PASS';
                            TestResults.Modify();
                            Commit();
                        end
                        else if (TestResults.Test = false) then begin
                            TestResults.TestResultString := 'FAIL';
                            TestResults.Modify();
                            Commit();
                        end;

                    until TestResults.Next = 0;
                end;
            end;


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


}