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
                        //  Style = stats;



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
                    QualityOrder: record "QualityOrderLineResultsTable";
                    CheckQuality: record "QualityResultsTable";

                begin
                    QualityOrder.SetFilter(QualityOrder, rec.QualityOrder);
                    if QualityOrder.Findlast() then begin
                        if (Rec.Status = Rec.Status::Open) then begin
                            CheckQuality.SetFilter(QualityOrder, rec.QualityOrder);
                            if CheckQuality.FindFirst() then begin
                                if (CheckQuality.TestResult = true) then begin
                                    if (rec.Quantityy = QualityOrder."SumQuantity") then begin
                                        rec.Status := rec.Status::Pass;
                                        rec.Modify();
                                        SaveRecord();
                                        Message('Status updated to Pass.');
                                    end
                                    else
                                        rec.Status := rec.Status::Open;
                                    Message('Status Will Stay Opened')
                                end;
                                if (CheckQuality.TestResult = false) then begin
                                    if (rec.Quantityy = QualityOrder."SumQuantity") then begin
                                        rec.Status := rec.Status::Fail;
                                        rec.Modify();
                                        SaveRecord();
                                        Message('Status Failed.');
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
        myInt: Integer;



}


