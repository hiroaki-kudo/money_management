class Category < ActiveHash::Base
  self.data = [
    { id: 6, name: '---' },
    { id: 1, name: '食べ物・飲み物' },
    { id: 2, name: '交通' },
    { id: 3, name: '学校で使う道具' },
    { id: 4, name: 'その他' },
    { id: 5, name: 'もらったお金' }
  ]
end
