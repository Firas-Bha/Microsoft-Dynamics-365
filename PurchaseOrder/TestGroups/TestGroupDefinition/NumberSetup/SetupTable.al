

table 50111 "Number Setup"
{
    
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PKEY; Code[10])
        {
            Caption = 'PKEY';
            DataClassification = ToBeClassified;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }

}