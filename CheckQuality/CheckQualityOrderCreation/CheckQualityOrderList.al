page 50122 CheckQualityPageList
{
    PageType = List;
    Caption = 'Check Quality List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CheckQualityOrderTable;
    CardPageId = "Check Quality Order Card";


    //Editable = false;

    layout
    {
        area(Content)
        {
            group(QualityOrdersCheck)
            {

                Caption = 'Quality Orders';
                repeater(QualityOrders)
                {


                    field(QualityOrder; rec.QualityOrder)
                    {
                        Caption = 'Quality Order';
                        ApplicationArea = All;
                    }
                    field("Vendor Name"; rec."No.")
                    {
                        Caption = 'Name';
                        ApplicationArea = All;
                    }

                    field(ItemNumber; rec.ItemNumber)
                    {
                        Caption = 'Item Number';
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


                    field(AccountSelection; rec.AccountSelection)
                    {
                        Caption = 'Account Selection';
                        ApplicationArea = All;
                    }

                    field(ReferenceNumber; rec.ReferenceNumber)
                    {
                        Caption = 'Reference Number';
                        ApplicationArea = All;
                    }

                    field(TestGroup; rec.TestGroup)
                    {
                        Caption = 'Test Group';
                        ApplicationArea = All;
                    }
                    /*
                    field(Quantity; rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ApplicationArea = All;
                    }
                    */
                    field(Status; rec.Status)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether the record is open, waiting to be approved';
                        StyleExpr = StyleExprtTxt;
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin
                            StyleExprtTxt := ChangeStatusColor.ChangeStatusColor(rec);
                        end;

                    }
                    field(ReferenceType; rec.ReferenceType)
                    {
                        Caption = 'Reference Type';
                        ApplicationArea = All;
                    }
                    field(Quantityy; rec.Quantityy)
                    {

                        ApplicationArea = All;
                    }


                }
            }

            group("Check Quality Results & Records")
            {

                part(QualityResults; QualityResultsList)
                {

                    Caption = 'List';
                    ApplicationArea = All;
                    SubPageLink = "QualityOrder" = field("QualityOrder");
                    UpdatePropagation = Both;

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
            action(AddQualityOrder)
            {
                ApplicationArea = All;
                Caption = 'Add Quality Order';
                Promoted = true;
                PromotedIsBig = true;
                Image = NewItem;
                PromotedCategory = Process;
                RunObject = page "Check Quality Order Card";

                trigger OnAction()
                begin

                end;
            }

            action(QualityOrderResults)
            {
                Caption = 'Quality Order Results';

                ApplicationArea = All;
                PromotedCategory = Category10;
                Promoted = true;
                PromotedIsBig = true;
                Image = ListPage;

                trigger OnAction();
                var
                    testgroup: Page "QualityResultsList";
                //Tests: Page "Tests Setup";
                begin
                    testgroup.run();
                end;
            }
            action(CertificateOFAnalysis)
            {
                ApplicationArea = Suite;
                Caption = 'Certificate Of Analysis Printing';
                Promoted = true;
                PromotedIsBig = true;
                Image = Certificate;
                PromotedCategory = Process;
                RunObject = page "CertificateOfAnalysisList";
                RunPageView = sorting("SequenceNumber");
                trigger OnAction()
                begin

                end;
            }
            action(QualityOrderLineResults)
            {
                ApplicationArea = Suite;
                Caption = 'Quality Order Line Results';
                Promoted = true;
                PromotedIsBig = true;
                Image = Certificate;
                PromotedCategory = Process;
                RunObject = page "QualityOrderLineResults";
                RunPageLink = "QualityOrder" = field("QualityOrder");
                /*
               trigger OnAction()

               var 
               page : page "QualityOrderLineResults";
               record: record  "QualityOrderLineResultsTable";
               begin
                   if record.Get(rec.QualityOrder) then
                   begin
                   page.Run();

                   end;
*/


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
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    Rec.FIND;
                    Rec.SETRECFILTER;
                    Report.Run(50128, true, true, Rec);
                    rec.Reset();
                end;

            }
           action(Validate)
{
    Caption = 'Validate';
    ApplicationArea = All;

    trigger OnAction()
    var
        QualityOrder: Record "QualityOrderLineResultsTable";
        CheckQuality: Record "QualityResultsTable";
    begin
        // Filter and find the last quality order record
        QualityOrder.SetFilter(QualityOrder, rec.QualityOrder);
        if QualityOrder.FindLast() then begin
            // Check if the current record status is "Open"
            if (rec.Status = rec.Status::Open) then begin
                // Filter and find the first check quality record
                CheckQuality.SetRange(QualityOrder, rec.QualityOrder);
                if CheckQuality.FindFirst() then begin
                    // If test result is true and quantity matches sum quantity
                    if (CheckQuality.TestResult = true) then begin
                        if (rec.Quantityy = QualityOrder."SumQuantity") then begin
                            rec.Status := rec.Status::Pass;
                            rec.Modify();
                            Message('Status updated to Pass.');
                        end else begin
                            rec.Status := rec.Status::Open;
                            Message('Status will stay Open.');
                        end;
                    end;
                    // If test result is false and quantity matches sum quantity
                    if (CheckQuality.TestResult = false) then begin
                        if (rec.Quantityy = QualityOrder."SumQuantity") then begin
                            rec.Status := rec.Status::Fail;
                            rec.Modify();
                            Message('Status updated to Fail.');
                        end;
                    end;
                end;
            end;
        end;
    end;
}

        }


    }
    var
        StyleExprtTxt: Text[50];
        ChangeStatusColor: Codeunit ChangeColor;


    trigger OnAfterGetRecord()
    begin
        StyleExprtTxt := ChangeStatusColor.ChangeStatusColor(Rec);
    end;


}

codeunit 50105 ChangeColor
{

    var
        myInt: Integer;

    procedure ChangeStatusColor(Quality: record CheckQualityOrderTable): Text[50]
    var
        myInt: Integer;
    begin
        with Quality do
            case Status of

                Status::Pass:
                    exit('favorable');
                Status::Fail:
                    exit('unfavorable');
                Status::Open:
                    exit('strongaccent');
            end;

    end;

}



