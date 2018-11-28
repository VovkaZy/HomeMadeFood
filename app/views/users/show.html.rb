<div class="row">
  <div class="col-md-3">
    <div class="center">
      <%= image_tag avatar_url(@user), class: "avatar-full" %>
   </div>
   <div class="panel panel-default">
     <div class="panel-heading">Verification</div>
     <div class="panel-body">
       Email Address<br/>
       Phone Number
     </div>
   </div>
 </div>

 <div class="col-md-9">
   <h2><%= @user.fullname %></h2>

   <div class="description row-space-3">
     <%= @user.description %>
    </div>
  </div>
</div>
