resource "aws_internet_gateway" "demo-igw" {  # Creating Internet Gateway
    vpc_id = "${aws_vpc.demo_vpc.id}"
    tags = {
        Name = "my-demo-igw"
    }
}
# Route table for Public Subnet's
resource "aws_route_table" "demo-public-crt" { # Creating RT for Public Subnet
    vpc_id = "${aws_vpc.demo_vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.demo-igw.id}" 
    }
    
    tags =  {
        Name = "my-demo-public-crt"
    }
}
#Route table Association with Public Subnet's
resource "aws_route_table_association" "demo-rt-associ-pub-subnet-1" {
    subnet_id = "${aws_subnet.demo-subnet-pub-1.id}"
    route_table_id = aws_route_table.demo-public-crt.id
 }
