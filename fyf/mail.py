#coding=utf8
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import  MIMEMultipart
from email.header  import Header
import os

#总目录用join连接起来
reportpath =os.path.join( os.getcwd(),'report')
# print reportpath

class Sendmail():
    # 总目录用join连接起来
    reportpath = os.path.join(os.getcwd(), 'report')

    # print reportpath

    def getreport(self):
        dirs = os.listdir(reportpath)

        # 注意sort的用法，不能这样写a = dirs.sort(),会输出none
        dirs.sort(key = lambda fn:os.path.getmtime(reportpath+'\\'+fn))

        report = os.path.join(os.path.join(reportpath,dirs[-1]))

        print report
        return  report

    def send_mail(self,report):
        # 定义服务器类型，登录名密码，发送人和接受人，发送邮件主题
        smtpserver = 'smtp.qq.com'

        user = 'fyf2782840@qq.com'
        passwd = 'vxkdfejinpifbeaj'

        sender = 'fyf2782840@qq.com'
        receiver = ['fyf2782840@qq.com','949308246@qq.com','2435109418@qq.com']

        header = 'happy new year !!!!!!!!!!'

       # 获取文件内容
        f = open(report,'rb')
        content = f.read()
        f.close()

        # 定义文件标题和发送内容格式或编码
        msg = MIMEText(content,'html','utf-8')
        msg['Subject'] = Header(header,'utf-8')
        msg['From'] = sender
        msg['To'] = ",".join(receiver)

        # 发送邮件,端口用465, keyfile = 'vxkdfejinpifbeaj'
        smtp = smtplib.SMTP_SSL(smtpserver,465)

        smtp.helo(smtpserver)
        smtp.ehlo(smtpserver)

        smtp.connect(smtpserver,465)
        smtp.login(user,passwd)
        smtp.sendmail(sender,receiver,msg.as_string())

        smtp.quit()




if  __name__== '__main__':
    mail = Sendmail()
    report = mail.getreport()
    mail.send_mail(report)

