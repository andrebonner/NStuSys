<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NStuSys._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
   
      
   
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            (Logo)
            <br />
            <asp:Label ID="userLoginInfo" runat="server" style="text-align: left"></asp:Label>

            <asp:MultiView runat="server" ID="multiview1">
                <asp:View ID="view1" runat="server">
                    <table id="fullStuInfo" runat="server">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <th colspan="6">Student Information</th>
                                    </tr>
                                    <tr>
                                        <td valign="bottom">
                                            <label>Photo:</label>
                                        </td>
                                        <td colspan="2" valign="bottom">
                                            <asp:FileUpload runat="server" ID="photoFile" />
                                            &nbsp;</td>
                                        <td colspan="3">

                                            <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl="~/no-photo.jpg" ToolTip="Student Photo" />

                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:HiddenField Value="" ID="studentId" runat="server" />
                                            <label>First Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="requiredFirstName" runat="server" Text="" ErrorMessage="*" ControlToValidate="firstName"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <label>Middle Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="middleName" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <label>Last Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="requiredLastName" runat="server" Text="" ErrorMessage="*" ControlToValidate="lastName"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <label>Birthday:</label></td>
                                        <td valign="top">
                                            <asp:TextBox ID="dateOfBirth" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="requiredDateOfBirth" runat="server" Text="" ErrorMessage="*" ControlToValidate="dateOfBirth"></asp:RequiredFieldValidator>

                                        </td>
                                        <td valign="top">
                                            <label>Sex:</label></td>
                                        <td>
                                            <asp:RadioButtonList runat="server" ID="sex" >
                                                <asp:ListItem Value="m">Male</asp:ListItem>
                                                <asp:ListItem Value="f">Female</asp:ListItem>
                                            </asp:RadioButtonList></td>
                                        <td valign="top">
                                            <label>Age:</label></td>
                                        <td valign="top">
                                            <asp:TextBox ID="age" runat="server" ></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td valign="top">Grade to Register for:</td>
                                        <td valign="top"><asp:TextBox ID="gradeRegister" runat="server"></asp:TextBox></td>
                                        <td valign="top">Previous Grade</td>
                                        <td valign="top"><asp:TextBox runat="server" ID="prevGrade"></asp:TextBox></td>
                                        <td valign="top">
                                            <label>Address:</label></td>
                                        <td valign="top">
                                            <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Height="77px" Width="199px" ></asp:TextBox>
                                        </td>                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <th colspan="4">Guardian Information</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>
                                                Guardian&#39;s First Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="gFirstName" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <label>
                                                Guardian&#39;s Last Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="gLastName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Contact Number:</label></td>
                                        <td>
                                            <asp:TextBox ID="gContact" runat="server"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td></td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <th colspan="4">Next of Kin Information</th>
                                    </tr>
                                    <tr>
                                        <td>

                                            <label>
                                                First
                                        Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="nokFirstName" runat="server"></asp:TextBox>
                                        </td>
                                        <td>

                                            <label>
                                                Last
                                        Name:</label></td>
                                        <td>
                                            <asp:TextBox ID="nokLastName" runat="server"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Contact Number:</label></td>
                                        <td>
                                            <asp:TextBox ID="nokContact" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <label>
                                                Relationship:</label></td>
                                        <td>
                                            <asp:DropDownList ID="nokRelationship" runat="server">
                                                <asp:ListItem>Mother</asp:ListItem>
                                                <asp:ListItem>Father</asp:ListItem>
                                                <asp:ListItem>Sister</asp:ListItem>
                                                <asp:ListItem>Brother</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="saveStudent" runat="server" Text="Save" OnClick="saveStudent_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="valSummary" runat="server" />
                            </td>
                        </tr>
                    </table>

                </asp:View>
                <asp:View runat="server" ID="view2">
                    <table id="stuInfo" runat="server">
                        <tr>
                            <th colspan="4">Student Information</th>
                        </tr>
                        <tr>

                            <td>
                                <label>First Name:</label></td>
                            <td>
                                <asp:TextBox ID="sFirstName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requiredSFirstName" runat="server" Text="" ErrorMessage="*" ControlToValidate="sFirstName"></asp:RequiredFieldValidator>
                            </td>

                            <td>
                                <label>Last Name:</label></td>
                            <td>
                                <asp:TextBox ID="sLastName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requiredSLastName" runat="server" Text="" ErrorMessage="*" ControlToValidate="sLastName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Sex:</label></td>
                            <td rowspan="2" valign="top">
                                <label>
                                    Contact:</label></td>
                            <td rowspan="2" valign="top">
                                <asp:TextBox ID="sContact" runat="server"></asp:TextBox>
                            </td>
                            <td rowspan="2"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList runat="server" ID="sSex">
                                    <asp:ListItem Value="m">Male</asp:ListItem>
                                    <asp:ListItem Value="f">Female</asp:ListItem>
                                </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Button ID="sSave" runat="server" Text="Save" CommandName="sSave" OnClick="sSave_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View runat="server" ID="view3">
                    <table id="StudentInfo" runat="server">
                        <tr>
                            <th>Student Information</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView runat="server" ID="gridview1" DataSourceID="sqldata1" EnableModelValidation="True" AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gridview1_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="firstname" HeaderText="First Name" SortExpression="firstname" />
                                        <asp:BoundField DataField="middlename" HeaderText="Middle Name" SortExpression="middlename" />
                                        <asp:BoundField DataField="lastname" HeaderText="Last Name" SortExpression="lastname" />
                                        <asp:BoundField DataField="sex" HeaderText="Sex" SortExpression="sex" />
                                        <asp:BoundField DataField="dateofbirth" HeaderText="Date of Birth" SortExpression="dateofbirth" />
                                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                        <asp:TemplateField ShowHeader="False" FooterText="Add">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editLink" runat="server" CausesValidation="false" CommandName="editButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Edit"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="deleteBtn" runat="server" CausesValidation="false" OnClientClick="return deleteDlg();" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="deleteButton" Text="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="addButtonFoot" runat="server" CausesValidation="false" Text="Add" OnClick="addButtonFoot_Click" />
                            </td>
                        </tr>
                    </table>
                    <script type="text/javascript" language="javascript">
                        function deleteDlg() {
                            return confirm("Delete this student?");
                        }
                    </script>
                </asp:View>
                <asp:View runat="server" ID="view4">
                    <table cellpadding="0" runat="server" id="changePwd">
                        <tr>
                            <td align="center" colspan="2">Change Your Password</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>



                </asp:View>
                <asp:View ID="view5" runat="server">
                    <table id="createUser" runat="server">
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="userTitle" runat="server">User</asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:HiddenField ID="userId" runat="server" Value="" />
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="RoleLabel" runat="server" AssociatedControlID="Role">Role:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="Role" runat="server" DataSourceID="sqldata2" DataTextField="role" DataValueField="Id" OnSelectedIndexChanged="Role_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqldata2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [role], [Id] FROM [roles]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RoleRequired" runat="server" ControlToValidate="Role" ErrorMessage="Role is required." ToolTip="Role is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="StatusLabel" runat="server" AssociatedControlID="status">Status:</asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="status" runat="server" Text="Active" />

                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="saveUserButton" runat="server" Text="Save User" CommandName="create" OnClick="saveUserButton_Click" />
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="repeater1" runat="server" DataSourceID="sqldata3" OnItemCommand="repeater1_ItemCommand">
                        <HeaderTemplate>
                            <table border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th colspan="4">Users</th>
                                </tr>
                                <tr>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Reg Date</th>
                                    <th></th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="background-color: skyblue;">
                                <td><%# DataBinder.Eval(Container.DataItem,"username") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem,"email") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem,"regdate")%></td>
                                <td><a href="?action=user&uid=<%# DataBinder.Eval(Container.DataItem,"Id") %>">Edit</a></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr>
                                <td><%# DataBinder.Eval(Container.DataItem,"username") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem,"email") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem,"regdate")%></td>
                                <td><a href="?action=user&uid=<%# DataBinder.Eval(Container.DataItem,"Id") %>">Edit</a></td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <tr>
                                <td colspan="4">Pages: 1</td>
                            </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sqldata3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [username], [email], [regdate] FROM [users]"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="view6" runat="server">
                    <table>
                        <tr>
                            <td>
                                <label>Firstname:</label>
                                <asp:Label ID="labelFirstname" runat="server"></asp:Label></td>
                            <td>
                                <label>Lastname</label>
                                <asp:Label ID="labelLastname" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label>Address</label>
                                <asp:Label ID="labelAddress" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" /></td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </div>
        <asp:SqlDataSource ID="sqldata1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, firstname, middlename, lastname, sex, dateofbirth, address FROM students"></asp:SqlDataSource>
    </form>
</body>
</html>
