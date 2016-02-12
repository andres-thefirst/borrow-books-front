var gulp = require('gulp');
var sass = require('gulp-sass');
var cssnano = require('gulp-cssnano');

gulp.task('styles', function() {
    gulp.src('./sass/*.sass')
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(gulp.dest('C:/Users/andres.g/workspace/front/src/main/webapp/resources/css/'));
});

//Watch task
gulp.task('default',function() {
    gulp.watch('./sass/**/*.sass',['styles']);
});