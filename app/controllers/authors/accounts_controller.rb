module Authors 
    class AccountsController < AuthorController   
        # edit and change password functionlity here
        def edit
            
        end

        def update_info
            if current_author.update(author_info_params)
                flash[:success] = 'Yayy!!. Your Info has been successfully updated.'
              else
                flash[:danger] = current_author.errors.full_messages.join(',') << ','
            end
            redirect_to authors_account_path
        end

        def change_password  
          if current_author.valid_password?(author_password_params[:current_password])    
                if current_author.change_password(author_password_params)
                    sign_in(current_author, bypass: true)
                    flash[:success] = 'Your current password is successfully updated.'
                else
                    flash[:danger] = current_author.errors.full_messages.join(',') << ','
                end         
            else  
            flash[:danger] = 'Your current password is incorrect.'
          end
          redirect_to authors_account_path            
        end

        private

        def author_info_params
            params.require(:author).permit(:name,:email,:bio)        
        end
        
        def author_password_params
            params.require(:author).permit(:current_password, :new_password, :password_confirmation)
        end
    
    end
end