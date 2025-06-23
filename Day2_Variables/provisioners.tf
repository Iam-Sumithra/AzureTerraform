resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

    provisioner "file" {
        source      = "file.txt"
        destination = "/tmp/file.txt"
        connection {
         type    = "ssh"
         user    = "ec2-user"
         private_key = file("~/.ssh/id_sha")
        }
    
    }
}
resource "null_resource" "exmaple" {
    provisioner "remote-exec" {
        inline = [
            "write-output 'hellp world'"
        ]
        connection {
            type = winrm
            user = "admin"
            password = "admin"
            host = aws_instance.example.public_ip
        }
}
}


resource "null_resource" "example" {
    provisioner "local-exec" {
        command = "echo Hello, World!"
    }
    
    provisioner "remote-exec" {
        inline = [
        "echo Hello from remote",
        "mkdir -p /tmp/terraform"
        ]
        connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host        = aws_instance.example.public_ip
        }
    }
}