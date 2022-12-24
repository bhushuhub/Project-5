pipeline{
    agent{
        node{
            label 'master'
            customWorkspace '/mnt/git-project'
        }
    }
    stages{
        stage ('build the project'){
            steps{
                /*sh "rm -rf /root/.m2"*/
                sleep 2
                sh "mvn clean install"
            }
        }
        stage ('deploy war file'){
            steps{
                sh "cp -r /mnt/git-project/webapp/target/WebApp.war /mnt/docker"
            }
        }
        stage ('create custom-image from dockerfile'){
            steps{
                dir ('/mnt/docker'){
                    sh "chmod -R 777 WebApp.war"
                    sh "docker build -t mytomcat:1.0 ."
                }
            }
        }
        stage ('create container'){
            steps{
                sh "docker run --name my-container -itdp 8090:8080 mytomcat:1.0"
            }
        }
    }
}
