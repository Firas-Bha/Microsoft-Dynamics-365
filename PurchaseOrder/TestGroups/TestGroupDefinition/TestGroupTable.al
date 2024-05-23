table 50140 TestGroupTable
{
    DataClassification = ToBeClassified;
    

    fields
    {
        field(1; TestGroup; Text[100])
        {
            Caption='Test Group';
            DataClassification = ToBeClassified;
            trigger OnValidate()    
            begin
              
            end;

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        
        }
        field(3; AcceptableQualityLevel; Decimal)
        {
            Caption = 'Acceptable Quality Level';
            DataClassification = ToBeClassified;
             trigger OnValidate()    
            begin
              
            end;
        }
        field(4; ItemSampling; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = ItemSamlingsTable."Item Sampling Value";
             trigger OnValidate()    
            begin
              
            end;
        }
        field(5; Destructive; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Test; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=TableTests.Test;
        }
        /*
         field(6; SequenceNumber; Integer)
        {
            DataClassification = ToBeClassified;
            

        }
        field(7; Test; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation=TableTests.Test;
        }
        field(8; Effective; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Expiration; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10; TestValue; Enum TestValue)
        {
            DataClassification = ToBeClassified;
        }
        */
        
       
    }

    keys
    {
        key(Key1; TestGroup)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
   begin
end; 
        
       
    
           
    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    var



}

