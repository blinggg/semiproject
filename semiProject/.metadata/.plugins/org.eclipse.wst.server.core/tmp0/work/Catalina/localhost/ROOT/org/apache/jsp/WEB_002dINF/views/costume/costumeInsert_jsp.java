/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2020-09-07 07:20:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.costume;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class costumeInsert_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>COSTUME</title>\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("* {\r\n");
      out.write("   font-family: '@여기어때 잘난체';\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#page {\r\n");
      out.write("   background: white;\r\n");
      out.write("   margin: 15px;\r\n");
      out.write("   padding-bottom: 30px;\r\n");
      out.write("   height: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content {\r\n");
      out.write("   margin-top: none;\r\n");
      out.write("   margin-left: 70px;\r\n");
      out.write("   margin-right: 70px;\r\n");
      out.write("   padding: 30px;\r\n");
      out.write("   margin-top: 10px;\r\n");
      out.write("   text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#tbl1 {\r\n");
      out.write("   width: 60%;\r\n");
      out.write("   margin: auto;\r\n");
      out.write("   overflow: hidden;\r\n");
      out.write("   border-collapse: collapse;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("td {\r\n");
      out.write("   padding: 15px;\r\n");
      out.write("   border-bottom: 1px solid #e360f2;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("th {\r\n");
      out.write("   padding: 15px;\r\n");
      out.write("   font-size: 30px;\r\n");
      out.write("   border-right: 3px solid #e360f2;\r\n");
      out.write("   border-bottom: 1px solid #e360f2;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".info {\r\n");
      out.write("   text-align: left;\r\n");
      out.write("   padding-left: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".title {\r\n");
      out.write("   font-size: 50px;\r\n");
      out.write("   text-align: center;\r\n");
      out.write("   margin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("select {\r\n");
      out.write("   width: 100%;\r\n");
      out.write("   height: 25px;\r\n");
      out.write("   font-size: 20px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   text-align-last: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("select option {\r\n");
      out.write("   height: 25px;\r\n");
      out.write("   font-size: 20px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   text-align-last: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".cart {\r\n");
      out.write("   width: 300px;\r\n");
      out.write("   height: 100px;\r\n");
      out.write("   font-size: 35px;\r\n");
      out.write("   margin: 2px;\r\n");
      out.write("   cursor: pointer;\r\n");
      out.write("   background: #e6bbea;\r\n");
      out.write("   color: white;\r\n");
      out.write("   border: none;\r\n");
      out.write("   border-radius: 3px 3px 3px 3px;\r\n");
      out.write("   float: right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".cart:active {\r\n");
      out.write("   background: #cca6cf;\r\n");
      out.write("}\r\n");
      out.write("/*스타일 추가하기*/\r\n");
      out.write("input[type=file] {\r\n");
      out.write("   visibility: hidden;\r\n");
      out.write("   height: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".hidden {\r\n");
      out.write("   display: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#btnList, input[type=\"submit\"] {\r\n");
      out.write("   width: 200px;\r\n");
      out.write("   height: 60px;\r\n");
      out.write("   font-size: 30px;\r\n");
      out.write("   margin: 2px;\r\n");
      out.write("   cursor: pointer;\r\n");
      out.write("   background: #e6bbea;\r\n");
      out.write("   color: white;\r\n");
      out.write("   border: none;\r\n");
      out.write("   border-radius: 3px 3px 3px 3px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#reset {\r\n");
      out.write("   width: 200px;\r\n");
      out.write("   height: 60px;\r\n");
      out.write("   font-size: 30px;\r\n");
      out.write("   margin: 2px;\r\n");
      out.write("   cursor: pointer;\r\n");
      out.write("   background: #969596;\r\n");
      out.write("   color: white;\r\n");
      out.write("   border: none;\r\n");
      out.write("   border-radius: 3px 3px 3px 3px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#reset:active {\r\n");
      out.write("   background: #757575;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("input[type=\"submit\"]:active, #btnList:active {\r\n");
      out.write("   background: #cca6cf;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn {\r\n");
      out.write("   margin: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("input[type=text] {\r\n");
      out.write("   height: 25px;\r\n");
      out.write("   font-size: 20px;\r\n");
      out.write("   text-align: center;\r\n");
      out.write("   border: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#image {\r\n");
      out.write("   cursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../index_include/menu.jsp", out, false);
      out.write("\r\n");
      out.write("   <div id=\"page\">\r\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../index_include/header.jsp", out, false);
      out.write("\r\n");
      out.write("      <div class=\"title\">⊙ COSTUME INSERT ⊙</div>\r\n");
      out.write("      <br> <br>\r\n");
      out.write("      <div id=\"content\">\r\n");
      out.write("         <form name=\"frm\" method=\"post\" action=\"/costumeInsert\"\r\n");
      out.write("            enctype=\"multipart/form-data\">\r\n");
      out.write("            <table id=\"tbl1\">\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <th width=200>CODE</th>\r\n");
      out.write("                  <td><input type=\"text\" name=\"lend_costume_code\"\r\n");
      out.write("                     placeholder=\"ex)Z001\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <th>NAME</th>\r\n");
      out.write("                  <td><input type=\"text\" name=\"lend_costume_name\"\r\n");
      out.write("                     placeholder=\"NAME\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <th>IMAGE</th>\r\n");
      out.write("                  <td width=400><img id=\"image\"\r\n");
      out.write("                     src=\"http://placehold.it/400x500\" width=400> <input\r\n");
      out.write("                     type=\"file\" id=\"isFile\" name=\"file\" accept=\"image/*\" /></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr class=\"hidden\">\r\n");
      out.write("                  <th>AMOUNT</th>\r\n");
      out.write("                  <td><input type=\"text\" name=\"lend_costume_amount\" value=1></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <th>PRICE</th>\r\n");
      out.write("                  <td><input type=\"text\" name=\"lend_costume_price\"\r\n");
      out.write("                     placeholder=\"PRICE\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <th>CONTENT</th>\r\n");
      out.write("                  <td><input type=\"text\" name=\"lend_costume_content\"\r\n");
      out.write("                     placeholder=\"상품상세정보를 입력해주세요\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <div class=\"btn\">\r\n");
      out.write("               <input type=\"submit\" value=\"SAVE\"> <input type=\"reset\"\r\n");
      out.write("                  value=\"RESET\" id=\"reset\"> <input type=\"button\"\r\n");
      out.write("                  value=\"LIST\" id=\"btnList\" onClick=\"location.href='/costumeList'\">\r\n");
      out.write("            </div>\r\n");
      out.write("         </form>\r\n");
      out.write("      </div>\r\n");
      out.write("   </div>\r\n");
      out.write("   ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../index_include/chat.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("   //유효성 검사추가 08.04\r\n");
      out.write("   $(frm).submit(function(e) {\r\n");
      out.write("      e.preventDefault();\r\n");
      out.write("      if (!confirm(\"저장하시겠습니까?\"))\r\n");
      out.write("         return;\r\n");
      out.write("\r\n");
      out.write("      var code = $(frm.lend_costume_code).val();\r\n");
      out.write("      var name = $(frm.lend_costume_name).val();\r\n");
      out.write("      var price = $(frm.lend_costume_price).val();\r\n");
      out.write("\r\n");
      out.write("      //이미지 관련 유효성 검사\r\n");
      out.write("      var imgFile = $(\"#isFile\").val();\r\n");
      out.write("      var fileForm = /(.*?)\\.(jpg|jpeg|png|gif|bmp|pdf)$/;\r\n");
      out.write("\r\n");
      out.write("      if (code == \"\") {\r\n");
      out.write("         alert(\"코스튬 코드를 입력하세요!\");\r\n");
      out.write("         $(frm.code).focus();\r\n");
      out.write("      } else if (name == \"\") {\r\n");
      out.write("         alert(\"코스튬명을 입력하세요!\");\r\n");
      out.write("         $(frm.name).focus();\r\n");
      out.write("      } else if ($(\"#isFile\").val() == \"\") {\r\n");
      out.write("         alert(\"이미지 첨부는 필수입니다!\");\r\n");
      out.write("         $(\"#isFile\").focus();\r\n");
      out.write("         return;\r\n");
      out.write("      } else if (!imgFile.match(fileForm)) {\r\n");
      out.write("         alert(\"이미지 파일만 업로드 가능합니다.\");\r\n");
      out.write("         return;\r\n");
      out.write("      } else if (price == \"\") {\r\n");
      out.write("         alert(\"코스튬 가격을 입력하세요!\");\r\n");
      out.write("         $(frm.price).focus();\r\n");
      out.write("      } else {\r\n");
      out.write("         frm.submit();\r\n");
      out.write("         alert(code + \"의 코스튬 내역이 입력되었습니다.\");\r\n");
      out.write("      }\r\n");
      out.write("   });\r\n");
      out.write("\r\n");
      out.write("   //이미지를 클릭했을때\r\n");
      out.write("   $(\"#image\").on(\"click\", function() {\r\n");
      out.write("      $(frm.file).click();\r\n");
      out.write("   });\r\n");
      out.write("\r\n");
      out.write("   $(\"#btnImage\").on(\"click\", function() {\r\n");
      out.write("      $(frm.files).click();\r\n");
      out.write("   });\r\n");
      out.write("\r\n");
      out.write("   //파일선택버튼을 눌렀을때(Multi)\r\n");
      out.write("   $(frm.files).on(\"change\", function() {\r\n");
      out.write("      var files = $(frm.files)[0].files;\r\n");
      out.write("      var html = \"\";\r\n");
      out.write("\r\n");
      out.write("      $.each(files, function(index, files) {\r\n");
      out.write("         html += \"<img src='\" + URL.createObjectURL(files) + \"'>\";\r\n");
      out.write("         $(\"#listFile\").html(html);\r\n");
      out.write("      });\r\n");
      out.write("\r\n");
      out.write("   });\r\n");
      out.write("\r\n");
      out.write("   //이미지미리보기 \r\n");
      out.write("   $(frm.file).change(function(e) {\r\n");
      out.write("      var reader = new FileReader();\r\n");
      out.write("      reader.onload = function(e) {\r\n");
      out.write("         $(\"#image\").attr(\"src\", e.target.result);\r\n");
      out.write("      }\r\n");
      out.write("      reader.readAsDataURL(this.files[0]);\r\n");
      out.write("   });\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
