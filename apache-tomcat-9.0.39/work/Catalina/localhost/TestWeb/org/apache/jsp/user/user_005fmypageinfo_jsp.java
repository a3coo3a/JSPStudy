/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.39
 * Generated at: 2020-11-07 13:40:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class user_005fmypageinfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/user/../include/footer.jsp", Long.valueOf(1604755501853L));
    _jspx_dependants.put("/user/../include/header.jsp", Long.valueOf(1604755713227L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

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

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/bootstrap.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/custom.css\">\r\n");
      out.write("        <title>BBS Test</title>  \r\n");
      out.write("\t</head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("    <nav class=\"navbar navbar-default\" id=\"nav\">\r\n");
      out.write("        <div class=\"navbar-header\">\r\n");
      out.write("            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("                <span class=\"icon-bar\"></span>\r\n");
      out.write("            </button>\r\n");
      out.write("            <a class=\"navbar-brand\" href=\"##\">MIN and PARK</a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("            <ul class=\"nav navbar-nav\">\r\n");
      out.write("                <li class=\"active\"><a href=\"##\" style=\"margin-right: 10px;\">메인</a></li>\r\n");
      out.write("                <li><a href=\"##\">게시판</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            \r\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                <li class=\"dropdown\">\r\n");
      out.write("                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">접속하기<span class=\"caret\"></span></a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                        <li><a href=\"#\">로그인</a></li>\r\n");
      out.write("                        <li><a href=\"#\">회원가입</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("       \r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>");
      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row join-wrap\">\r\n");
      out.write("                <!--join-form을 적용한다 float해제 margin:0 auto-->\r\n");
      out.write("                <div class=\"col-xs-12 col-md-9 join-form\">\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"titlebox\">\r\n");
      out.write("                        MEMBER INFO                    \r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                    <p>*표시는 필수 입력 표시입니다</p>\r\n");
      out.write("                    <table class=\"table\">\r\n");
      out.write("                        <tbody class=\"m-control\">\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*ID</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*이름</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*비밀번호</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*비밀번호확인</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*E-mail</td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <input class=\"form-control input-sm\">@\r\n");
      out.write("                                    <select class=\"form-control input-sm sel\">\r\n");
      out.write("                                        <option>naver.com</option>\r\n");
      out.write("                                        <option>gmail.com</option>\r\n");
      out.write("                                        <option>daum.net</option>\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                    <button class=\"btn btn-info\">중복확인</button>\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*휴대폰</td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <input class=\"form-control input-sm sel\"> -\r\n");
      out.write("                                    <input class=\"form-control input-sm sel\"> -\r\n");
      out.write("                                    <input class=\"form-control input-sm sel\">\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*주소</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm add\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td class=\"m-title\">*상세주소</td>\r\n");
      out.write("                                <td><input class=\"form-control input-sm add\"></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"titlefoot\">\r\n");
      out.write("                        <button class=\"btn\">수정</button>\r\n");
      out.write("                        <button class=\"btn\">목록</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </section>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <footer>\r\n");
      out.write("        <div class=\"copyright py-4 text-center text-white\">\r\n");
      out.write("            <div class=\"container bounceIn animate\">\r\n");
      out.write("                <small>Copyright<!-- &copy; --> 2019.<a href=\"\"> Min and Park</a></small>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </footer>\r\n");
      out.write("    \r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("    <script src=\"../js/bootstrap.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
